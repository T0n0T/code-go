package main

import (
	"fmt"

	"github.com/go-pg/pg/v10"
	"github.com/go-pg/pg/v10/orm"
)

type User struct {
	Id     int64
	Name   string
	Emails []string
}

func (u User) String() string {
	return fmt.Sprintf("User<%d %s %v>", u.Id, u.Name, u.Emails)
}

type Story struct {
	Id       int64
	Title    string
	AuthorId int64
	Author   *User `pg:"rel:has-one"`
}

func (s Story) String() string {
	return fmt.Sprintf("Story<%d %s %s>", s.Id, s.Title, s.Author)
}

func main() {
	db := pg.Connect(&pg.Options{
		User:     "postgres",
		Password: "1",
		Database: "test",
	})
	defer db.Close()

	createSchema(db)

	user1 := &User{
		Name:   "admin",
		Emails: []string{"admin1@admin", "admin2@admin"},
	}

	//增
	db.Model(user1).Insert()
	db.Model(&User{
		Name:   "root",
		Emails: []string{"root1@root", "root2@root"},
	}).Insert()

	story1 := &Story{
		Title:    "Cool story",
		AuthorId: user1.Id,
	}
	db.Model(story1).Insert()

	//删
	// Select user by primary key.
	user := &User{Id: user1.Id}
	result, _ := db.Model(user).WherePK().Delete()
	fmt.Println(result)
	fmt.Println(user)

	//改
	user2 := &User{Id: user1.Id, Name: "ppp", Emails: []string{"123@"}}
	result, _ = db.Model(user2).WherePK().Update()
	fmt.Println(result)
	fmt.Println(user2)
	//查
	// Select all users.
	var users []User
	db.Model(&users).Select()
	fmt.Println(users)

	// Select story and associated author in one query.
	story := new(Story)
	db.Model(story).
		Relation("Author").
		Where("story.id = ?", story1.Id).
		Select()

	fmt.Println(story)

}

// createSchema creates database schema for User and Story models.
func createSchema(db *pg.DB) error {
	models := []interface{}{
		(*User)(nil),
		(*Story)(nil),
	}

	for _, model := range models {
		err := db.Model(model).CreateTable(&orm.CreateTableOptions{
			// Temp:          true,
			FKConstraints: true,
		})
		if err != nil {
			return err
		}
	}
	return nil
}
