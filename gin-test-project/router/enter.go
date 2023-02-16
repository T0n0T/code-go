package router

type Routergroup struct {
	Db DbRouter
}

var RouterEnter = new(Routergroup)
