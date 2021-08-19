package controllers

import (
	"github.com/labstack/echo"
	"github.com/labstack/gommon/log"
	"net/http"
	"startcoinAirDrop/dao"
	"startcoinAirDrop/models"
)

type reqData struct {
	Id      int         `json:"id"`
	Jsonrpc string      `json:"jsonrpc"`
	Method  string      `json:"method"`
	Params  interface{} `json:"params"`
}

type reqParams struct {
	FunctionId string      `json:"function_id"`
	TypeArgs   interface{} `json:"type_args"`
	Args       interface{} `json:"args"`
}

func GetRecords(c echo.Context) error {
	addr := c.QueryParam("addr")
	networkVersion := c.QueryParam("networkVersion")
	list, err := dao.Record{}.GerRecords(addr, networkVersion)

	if err != nil {
		log.Error("Get Records Error => ", err)
		rlt := &models.Template{
			ErrNo:  http.StatusExpectationFailed,
			ErrMsg: "Get Records Error",
			Data:   nil,
		}
		return c.JSON(http.StatusOK, rlt)
	}
	// GetStatus(functionId, typeArgs, list)
	rlt := &models.Template{
		ErrNo:  http.StatusOK,
		ErrMsg: "success",
		Data:   list,
	}
	return c.JSON(http.StatusOK, rlt)
}

func UpdateStatus(c echo.Context) error {
	id := c.QueryParam("id")
	status := c.QueryParam("status")
	addr := c.QueryParam("address")
	err := dao.Record{}.UpdateStatus(addr, id, status)
	if err != nil {
		rlt := &models.Template{
			ErrNo:  http.StatusExpectationFailed,
			ErrMsg: "Update failed",
			Data:   nil,
		}
		log.Error(err)
		return c.JSON(http.StatusOK, rlt)
	}
	rlt := &models.Template{
		ErrNo:  http.StatusOK,
		ErrMsg: "success",
		Data:   nil,
	}
	return c.JSON(http.StatusOK, rlt)
}
