package common

// CheckErr 错误校验
func CheckErr(err error) {
	if err != nil {
		panic(err)
	}
}
