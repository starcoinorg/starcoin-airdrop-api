package route

import (
	"github.com/labstack/echo"
	"github.com/labstack/echo/middleware"
	"startcoinAirDrop/controllers"
	"startcoinAirDrop/dao"
)

func Run() {
	e := echo.New()
	e.HideBanner = true
	dao.Init()
	e.Use(middleware.Recover())
	e.Use(middleware.Logger())
	e.Use(middleware.CORSWithConfig(middleware.CORSConfig{
		AllowOrigins: []string{"http://localhost:3000", "http://10.31.0.22:3000"},
		AllowCredentials: true,
	}))
	e.Use(middleware.CORS())
	e.GET("/getProjectList", controllers.GetList)
	e.POST("/uploadProject", controllers.GetExcel)
	e.GET("/getlist", controllers.GetRecrods)
	e.GET("/updatestatus", controllers.UpdateStatus)
	e.Logger.Fatal(e.Start(":1323"))
}