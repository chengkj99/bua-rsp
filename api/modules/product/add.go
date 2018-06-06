package product

import (
	"net/http"

	"github.com/labstack/echo"
)

// Add for route of add
func Add(c echo.Context) error {
	return c.String(http.StatusOK, " add product!")
}
