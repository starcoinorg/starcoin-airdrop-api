package route

import (
	"startcoinAirDrop/controllers"
	"startcoinAirDrop/dao"

	"github.com/labstack/echo"
	"github.com/labstack/echo/middleware"
)

func Run() {
	e := echo.New()
	e.HideBanner = true
	dao.Init()
	e.Use(middleware.Recover())
	e.Use(middleware.Logger())
	e.Use(middleware.CORSWithConfig(middleware.CORSConfig{
		AllowOrigins:     []string{"*"},
		AllowCredentials: true,
	}))
	e.Use(middleware.CORS())
	e.GET("/getProjectList", controllers.GetList)
	e.POST("/uploadProject", controllers.GetExcel)
	e.GET("/getlist", controllers.GetRecords)
	e.GET("/updatestatus", controllers.UpdateStatus)
	e.Logger.Fatal(e.Start(":8081"))
}
