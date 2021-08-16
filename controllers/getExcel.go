package controllers

import (
	"encoding/csv"
	"fmt"
	"github.com/labstack/echo"
	"github.com/labstack/gommon/log"
	"io"
	"net/http"
	"startcoinAirDrop/models"
)

func GetExcel(c echo.Context) error {
	file, err := c.FormFile("file")
	if err != nil {
		log.Error("Get file failed => ", err)
		rlt := &models.Template{
			ErrNo: http.StatusOK,
			ErrMsg: "Get file failed",
			Data: nil,
		}
		return c.JSON(http.StatusOK, rlt)
	}
	src, err := file.Open()
	if err != nil {
		log.Error("Open file failed => ", err)
		rlt := &models.Template{
			ErrNo: http.StatusOK,
			ErrMsg: "Open file failed",
			Data: nil,
		}
		return c.JSON(http.StatusOK, rlt)
	}
	excelFile := csv.NewReader(src)
	//if err != nil {
	//	log.Error("Read file failed => ", err)
	//	rlt := &models.Template{
	//		ErrNo: http.StatusOK,
	//		ErrMsg: "Read file failed",
	//		Data: nil,
	//	}
	//	return c.JSON(http.StatusOK, rlt)
	//}

	for {
		record, err := excelFile.Read()
		if err == io.EOF {
			break
		} else if err != nil {
			log.Error("read file failed => ", err)
			rlt := &models.Template{
				ErrNo: http.StatusOK,
				ErrMsg: "read file failed",
				Data: nil,
			}
			return c.JSON(http.StatusOK, rlt)
		}
		for _, i := range record {
			fmt.Println(i)
		}
	}
	rlt := &models.Template{
		ErrNo: http.StatusOK,
		ErrMsg: "success",
		Data: nil,
	}
	return c.JSON(http.StatusOK, rlt)
}
