package overview

import (
	"bua-rsp/api/modules/common"
	"bua-rsp/api/modules/publisher"
	"bua-rsp/api/modules/user"
	"net/http"

	"github.com/labstack/echo"
)

// Route 用户管理路由
// 前缀 /overview
func Route(rg *echo.Group) {
	// 根据 ID 获取用户信息
	rg.GET("*", GetOverview)
}

// GetOverview 根据 cookie 的 user type 请求相应的信息
func GetOverview(c echo.Context) error {
	cookie, err := c.Cookie("utype")
	common.CheckErr(err)
	if cookie.Value == "user" {
		return user.GetUserByCookie(c)
	}
	if cookie.Value == "publisher" {
		return publisher.GetPublisherByCookie(c)
	}
	return c.JSON(http.StatusBadRequest, common.Response{Code: 500, Message: "cookie 中没有 utype", Data: nil})
}
