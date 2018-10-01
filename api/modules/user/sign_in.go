package user

import (
	"bua-rsp/api/db"
	"bua-rsp/api/modules/common"
	"net/http"

	"github.com/labstack/echo"
)

// 登录 login
func SignIn(c echo.Context) error {
	var user User
	var databaseUser User

	c.Bind(&user)
	engine := db.Engine
	engine.Where("name = ?", user.Name).Get(&databaseUser)

	if (user.Name == "" || user.Password == "") {
		return c.JSON(http.StatusOK, common.Response{Code: 403, Message: "登录失败", Data: nil})
	}

	if user.Password != databaseUser.Password {
		return c.JSON(403, common.Response{Code: 403, Message: "密码不正确", Data: nil})
	}

	return c.JSON(http.StatusOK, common.Response{Code: 200, Message: "ok", Data: databaseUser})
}
