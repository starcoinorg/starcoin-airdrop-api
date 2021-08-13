package dao

import "github.com/labstack/gommon/log"

type ProjectInfo struct {
	Id int32 `db:"id"`
	Amount float64 `db:"amount"`
	Token string `db:"token"`
	Project string `db:"project"`
	TotalAmount float64 `db:"total_amount"`
	ValidAmount float64 `db:"valid_amount"`
	CreateTime string `db:"create_time"`
	ExpireTime string `db:"expire_time"`
	Status int32 `json:"status"`
}

type ProjectList []ProjectInfo

func (p ProjectInfo) GetProjectList(status string)(ProjectList, error) {
	List := ProjectList{}
	sql := "SELECT p.id, p.token, p.project, p.total_amount, p.valid_amount, p.create_time, p.expire_time FROM starcoin_airdrop.project_list AS p"
	var err error
	if status == "all" {
		err = DB.Select(&List, sql)
	} else {
		sql += " AND p.status=?"
		err = DB.Select(&List, sql, status)
	}
	if err != nil {
		log.Error("GetProjectList Error => ", err)
		return nil, err
	}
	return List, nil
}

func (p ProjectInfo) GetProjectCount(status string) (int32, error) {
	var count int32
	var err error
	sql := "SELECT COUNT(*) FROM project_list"
	if status == "all" {
		err = DB.QueryRow(sql).Scan(&count)
	} else {
		sql += " WHERE status=?"
		err = DB.QueryRow(sql, status).Scan(&count)
	}
	if err != nil {
		log.Error("GetProjectCount Error =>", err)
		return 0, err
	}
	return count, nil
}

func (p ProjectInfo) GetStatus(projectId int32, addr string) (int32, error) {
	var count int32
	sql := "SELECT COUNT(*) FROM airdrop_amount WHERE address=? AND project_id=?"
	err := DB.QueryRow(sql, addr, projectId).Scan(&count)
	if err != nil {
		log.Error("GetStatus Error => ", err)
		return 0, err
	}
	return count, nil
}