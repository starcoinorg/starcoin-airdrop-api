package dao

import (
	_ "github.com/go-sql-driver/mysql"
	"github.com/jmoiron/sqlx"
	"github.com/labstack/gommon/log"
)

var DB *sqlx.DB

func Init() {
	dbType := "mysql"
	dbConn := "root:Lijiaqi1992@tcp(127.0.0.1:3306)/starcoin_airdrop"
	db, err := sqlx.Connect(dbType, dbConn)
	DB = db
	if err != nil {
		log.Error("sql connect fail => ", err)
	}
	log.Info("sql is connected")
}
