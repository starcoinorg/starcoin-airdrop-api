package controllers

import (
	"encoding/json"
	"github.com/labstack/echo"
	"github.com/labstack/gommon/log"
	"io/ioutil"
	"net/http"
	"startcoinAirDrop/dao"
	"startcoinAirDrop/models"
	"strings"
)

type reqData struct {
	Id int `json:"id"`
	Jsonrpc string `json:"jsonrpc"`
	Method string `json:"method"`
	Params interface{} `json:"params"`
}

type reqParams struct {
	FunctionId string `json:"function_id"`
	TypeArgs interface{} `json:"type_args"`
	Args interface{} `json:"args"`
}

func GetRecrods(c echo.Context) error {
	addr := c.QueryParam("addr")
	// functionId := c.QueryParam("function_id")
	// typeArgs := []string{c.QueryParam("type_args")}
	list, err := dao.Record{}.GerRecords(addr)

	if err != nil {
		log.Error("Get Records Error => ", err)
		rlt := &models.Template{
			ErrNo: http.StatusExpectationFailed,
			ErrMsg: "Get Records Error",
			Data: nil,
		}
		return c.JSON(http.StatusOK, rlt)
	}
	// GetStatus(functionId, typeArgs, list)
	rlt := &models.Template{
		ErrNo: http.StatusOK,
		ErrMsg: "success",
		Data: list,
	}
	return c.JSON(http.StatusOK, rlt)
}

func GetStatus(functionId string, typeArgs interface{}, list dao.RecordList) {
	var listParams []interface{}
	for _, v := range list {
		p := &reqParams{
			FunctionId: functionId,
			TypeArgs: typeArgs,
			Args: [] interface{}{v.OwnerAddress, v.AirdropId, v.Root, v.Idx},
		}
		listParams = append(listParams, p)
		log.Info(p)
	}
	args := &reqData{
		Id: 101,
		Jsonrpc: "2.0",
		Method: "contract.call_v2",
		Params: listParams,
	}
	jsons, err := json.Marshal(args)
	log.Error(err)
	rlt := string(jsons)
	log.Info("=============>", args)
	log.Info("=============>", listParams)
	log.Info("=============>", rlt)
	jsoninfo := strings.NewReader(rlt)
	req, err := http.NewRequest("POST", "https://halley-seed.starcoin.org", jsoninfo)
	req.Header.Set("Content-Type", "application/json")
	if err != nil {
		log.Error("Request ERROR =>", err)
	}
	client := &http.Client{}
	resp, err := client.Do(req)
	if err != nil {
		log.Error("Request Resp ERROR =>", err)
	}
	defer resp.Body.Close()
	rl, _ := ioutil.ReadAll(resp.Body)
	log.Info("******>", resp)
	log.Info("******>", resp.Body)
	log.Info("********", rl)
}

