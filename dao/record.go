package dao

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
	Status interface{} `db:"status"`
	Create string `db:"created_at"`
	Update string `db:"updated_at"`
}

type RecordList []Record

func (r Record) GerRecords (addr string) (RecordList, error) {
	list := RecordList{}
	sql := "SELECT * FROM airdrop_records WHERE address=?"
	err := DB.Select(&list, sql, addr)
	if err != nil {
		return nil, err
	}
	return list, nil
}
