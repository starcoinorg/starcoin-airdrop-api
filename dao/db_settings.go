package dao

type App struct {
	Id int
}

type Db struct {
	Name string
	Addr string
	Username string
	Password string
	Port string
}

type AppConfig struct {
	App App
	Db Db
}