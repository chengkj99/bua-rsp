package publisher

import (
	"bua-rsp/api/db"
	"bua-rsp/api/modules/common"
	"net/http"
	"strconv"

	"github.com/labstack/echo"
)

// Delete for route of delete
func Delete(c echo.Context) error {
	var publisher Publisher
	var code int
	var data interface{}
	var message string
	engine := db.Engine
	id, _ := strconv.Atoi(c.Param("id"))

	affected, err := engine.Id(id).Delete(&publisher)
	common.CheckErr(err)
	if affected == 0 {
		code = 50000
		data = nil
		message = "删除失败"
	} else {
		code = 200
		data = affected
		message = "ok"
	}
	return c.JSON(http.StatusOK, common.Response{Code: code, Message: message, Data: data})
}
