package dao

import (
	_ "github.com/go-sql-driver/mysql"
	"github.com/jmoiron/sqlx"
	"github.com/labstack/gommon/log"
	"github.com/spf13/viper"
	"os"
	"strconv"
)

var DB *sqlx.DB

func Init() {
	c := &AppConfig{}
	v := viper.New()
	p, _ := os.Getwd()
	v.SetConfigName("settings")
	v.AddConfigPath(p+"/config")
	v.SetConfigType("yaml")
	err := v.ReadInConfig()
	if err != nil {
		log.Fatal("Load configuration file err %s", err)
	}
	configs := v.AllSettings()
	for k, val := range configs {
		v.SetDefault(k, val)
	}
	err = v.Unmarshal(c)
	log.Info(v.GetStringMap("db")["name"])
	dbConfig := v.GetStringMap("db")
	dbName := dbConfig["name"].(string)
	dbPwd := dbConfig["password"].(string)
	dbPort := strconv.Itoa(dbConfig["port"].(int))
	dbUserName := dbConfig["username"].(string)
	dbAddr := dbConfig["addr"].(string)
	dbType := "mysql"
	dbConn := dbUserName+ ":" + dbPwd + "@tcp(" + dbAddr + ":" + dbPort +")/"+dbName
	log.Info(dbConn)
	db, err := sqlx.Connect(dbType, dbConn)
	DB = db
	if err != nil {
		log.Error("sql connect fail => ", err)
	}
	log.Info("sql is connected")
}
