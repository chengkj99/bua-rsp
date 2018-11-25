package common

import (
	"net/http"
	"time"
)

func GetCookie(name string, value string) *http.Cookie {
	cookie := new(http.Cookie)
	cookie.Name = name
	cookie.Value = value
	cookie.Expires = time.Now().Add(24 * time.Hour)
	cookie.Path = "/"
	return cookie
}
