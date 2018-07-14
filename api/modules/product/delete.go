package product

import (
	"bua-rsp/api/db"
	"bua-rsp/api/modules/common"
	"net/http"
	"strconv"

	"github.com/labstack/echo"
)

// Delete for route of delete
func Delete(c echo.Context) error {
	var product Product
	var data interface{}
	var message string
	engine := db.Engine
	id, _ := strconv.Atoi(c.Param("id"))

	affected, err := engine.Id(id).Delete(&product)
	common.CheckErr(err)
	if affected == 0 {
		data = nil
		message = "删除失败"
	} else {
		data = affected
		message = "ok"
	}
	return c.JSON(http.StatusOK, common.Response{Code: 200, Message: message, Data: data})
}
