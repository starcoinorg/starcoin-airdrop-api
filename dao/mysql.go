package dao

import (
	"os"

	_ "github.com/go-sql-driver/mysql"
	"github.com/jmoiron/sqlx"
	"github.com/labstack/gommon/log"
)

var DB *sqlx.DB

func Init() {
	dbHost := os.Getenv("STARCOIN_AIRDROP_MYSQL_HOST")
	dbPwd := os.Getenv("STARCOIN_AIRDROP_MYSQL_PWD")
	dbName := os.Getenv("STARCOIN_AIRDROP_MYSQL_DB")
	dbPort := os.Getenv("STARCOIN_AIRDROP_MYSQL_PORT")
	dbUserName := os.Getenv("STARCOIN_AIRDROP_MYSQL_USER")

	dbType := "mysql"
	dbConn := dbUserName + ":" + dbPwd + "@tcp(" + dbHost + ":" + dbPort + ")/" + dbName
	log.Info(dbConn)
	db, err := sqlx.Connect(dbType, dbConn)
	DB = db
	if err != nil {
		log.Error("sql connect fail => ", err)
	}
	log.Info("sql is connected")
}
