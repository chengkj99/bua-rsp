package user

import (
	"bua-rsp/api/db"
	"bua-rsp/api/modules/common"
	"net/http"
	"strconv"

	"github.com/labstack/echo"
)
func GetUsers(c echo.Context) error {
	engine := db.Engine
	var users Users
	engine.Sql("SELECT * FROM user").Find(&users.Data)

	res := common.Response{
		Code:    http.StatusOK,
		Message: http.StatusText(http.StatusOK),
		Data:    users.Data,
	}

	return c.JSON(http.StatusOK, res)
}

// GetUserByID 根据 Id 查询
func GetUserByID(c echo.Context) error {
	engine := db.Engine
	id, _ := strconv.Atoi(c.Param("id"))
	user := &User{Id: int64(id)}
	has, err := engine.Get(user)
	common.CheckErr(err)
	if has {
		return c.JSON(http.StatusOK, common.Response{Code: 200, Message: "ok", Data: user})
	}
	return c.JSON(http.StatusOK, common.Response{Code: 200, Message: "ok", Data: nil})
}
