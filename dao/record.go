package dao

import (
	"github.com/labstack/gommon/log"
	"strconv"
)

type Record struct {
	Id int32 `db:"id"`
	Address string `db:"address"`
	Amount string `db:"amount"`
	Idx string `db:"idx"`
	Proof interface{} `db:"proof"`
	ProjectId string `db:"project_id"`
	AirdropId int64 `db:"air_drop_id"`
	OwnerAddress string `db:"owner_address"`
	Root string `db:"root"`
	Status int32 `db:"status"`
	CreateAt string `db:"created_at"`
	UpdateAt string `db:"updated_at"`
	NetworkVersion string `db:"network_version"`
	EndAt string `db:"end_at"`
	StartAt string `db:"start_at"`
}

type RecordList []Record

func (r Record) GerRecords (addr string) (RecordList, error) {
	list := RecordList{}
	sql := "SELECT * FROM airdrop_records WHERE address=?"
	err := DB.Select(&list, sql, addr)
	if err != nil {
		return nil, err
	}
	log.Info("***********>", list[0])
	return list, nil
}

func (r Record) UpdateStatus (addr string, id string, status string, networkVersion string) error {
	recordId,_ := strconv.Atoi(id)
	recordStatus,_ := strconv.Atoi(status)
	sql := "UPDATE airdrop_records SET status = ? WHERE address = ? AND id = ? and network_version = ?"
	_, err := DB.Exec(sql, recordStatus, addr, recordId, networkVersion)
	return err
}
