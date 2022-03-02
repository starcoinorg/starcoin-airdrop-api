package dao

import (
	"strconv"

	"github.com/labstack/gommon/log"
)

type Record struct {
	Id             int32  `db:"id"`
	Address        string `db:"address"`
	Amount         string `db:"amount"`
	Idx            string `db:"idx"`
	Proof          string `db:"proof"`
	Status         int32  `db:"status"`
	AirdropId      int64  `db:"airdrop_id"`
	Name           string `db:"name"`
	NameEN         string `db:"name_en"`
	Token          string `db:"token"`
	Symbol         string `db:"token_symbol"`
	Precision      string `db:"token_precision"`
	Icon           string `db:"token_icon"`
	StartAt        string `db:"start_at"`
	EndAt          string `db:"end_at"`
	OwnerAddress   string `db:"owner_address"`
	Root           string `db:"root"`
	NetworkVersion string `db:"network_version"`
}

type RecordList []Record

func (r Record) GerRecords(addr string, networkVersion string) (RecordList, error) {
	list := RecordList{}
	sql := `select a.id, a.address, a.amount, a.idx, a.proof, a.status, a.airdrop_id, b.name, b.name_en, b.token, b.token_symbol, b.token_precision, b.token_icon, b.start_at, b.end_at, b.owner_address, b.root, b.network_version 
			from airdrop_records a join airdrop_projects b on a.airdrop_id = b.id
			where a.address=? and b.network_version = ?
			order by a.id desc`
	err := DB.Select(&list, sql, addr, networkVersion)
	if err != nil {
		log.Error(err)
		return nil, err
	}
	return list, nil
}

func (r Record) UpdateStatus(id string, status string) error {
	recordId, _ := strconv.Atoi(id)
	recordStatus, _ := strconv.Atoi(status)
	sql := "UPDATE airdrop_records SET status = ? WHERE id = ?"
	_, err := DB.Exec(sql, recordStatus, recordId)
	return err
}
