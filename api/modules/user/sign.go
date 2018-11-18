package user

import (
	"bua-rsp/api/db"
	"bua-rsp/api/modules/common"
	"net/http"
	"strconv"
	"time"

	"github.com/labstack/echo"
)

func writeCookie(c echo.Context) error {
	cookie := new(http.Cookie)
	cookie.Name = "username"
	cookie.Value = "jon"
	cookie.Expires = time.Now().Add(24 * time.Hour)
	c.SetCookie(cookie)
	return c.String(http.StatusOK, "write a cookie")
}

// 登录 login
func SignIn(c echo.Context) error {
	var user User
	var databaseUser User

	c.Bind(&user)
	engine := db.Engine
	engine.Where("name = ?", user.Name).Get(&databaseUser)

	if user.Name == "" || user.Password == "" {
		return c.JSON(http.StatusOK, common.Response{Code: 403, Message: "登录失败", Data: nil})
	}

	if user.Password != databaseUser.Password {
		return c.JSON(403, common.Response{Code: 403, Message: "密码不正确", Data: nil})
	}

	cookie := new(http.Cookie)
	cookie.Name = "uid"
	cookie.Value = strconv.FormatInt(databaseUser.Id, 10)
	cookie.Expires = time.Now().Add(24 * time.Hour)
	cookie.Path = "/"
	c.SetCookie(cookie)

	return c.JSON(http.StatusOK, common.Response{Code: 200, Message: "ok", Data: databaseUser})
}
