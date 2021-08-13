package controllers

import (
	"github.com/labstack/echo"
	"github.com/labstack/gommon/log"
	"net/http"
	"startcoinAirDrop/dao"
	"startcoinAirDrop/models"
	"time"
)

type ListResp struct {
	Data interface{}
	Count int32
}


func GetList(c echo.Context) error {
	status := c.QueryParam("status")
	addr := c.QueryParam("addr")
	list, err := dao.ProjectInfo{}.GetProjectList(status)
	count, err := dao.ProjectInfo{}.GetProjectCount(status)
	if err != nil {
		log.Error(err)
		rlt := &models.Template{
			ErrNo: http.StatusExpectationFailed,
			ErrMsg: "Get List Error",
			Data: nil,
		}
		return c.JSON(http.StatusOK, rlt)
	}
	loc, _ := time.LoadLocation("Local")
	for index, value := range list {
		count, err :=dao.ProjectInfo{}.GetStatus(value.Id, addr)
		if err != nil {
			log.Error("GetStaus in loop Error => ", err)
			rlt := &models.Template{
				ErrNo: http.StatusExpectationFailed,
				ErrMsg: "Get List Error",
				Data: nil,
			}
			return c.JSON(http.StatusOK, rlt)
		}
		now := time.Now().UTC()
		expireTime, err := time.ParseInLocation("2006-01-02 15:04:05", value.ExpireTime, loc)
		if count == 1 {
			value.Status = 1
			list[index] = value
		} else {
			if now.Sub(expireTime).Seconds() >= 0 {
				value.Status = 2
			} else {
				value.Status = 3
			}
			list[index] = value
		}
	}
	log.Info(list)

	rlt := &models.Template{
		ErrNo: http.StatusOK,
		ErrMsg: "success",
		Data: &ListResp{
			Data: list,
			Count: count,
		},
	}
	return c.JSON(http.StatusOK, rlt)
}
