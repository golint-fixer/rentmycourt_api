package core

import (
    "database/sql"
    "fmt"
    _ "github.com/lib/pq"
    log "github.com/Sirupsen/logrus"
)

const (
    DB_USER     = "rentmycourt"
    DB_PASSWORD = "rentmycourt"
    DB_NAME     = "rentmycourt"
)

var db *sql.DB

func initConnection() {
    var err error
    fmt.Println("Init DB connection !")
    dbinfo := fmt.Sprintf("user=%s password=%s dbname=%s sslmode=disable",
        DB_USER, DB_PASSWORD, DB_NAME)
    db, err = sql.Open("postgres", dbinfo)
    checkErr(err)
}

func Status() string {
    log.Info("Retrieve status of DB connection")
    status := "Okay"

    initConnection();
    defer db.Close()

    err := db.Ping();
    if checkErr(err) {
      status = "Trouble with the DB"
    }

    return status
}

func checkErr(err error) bool {
    if err != nil {
        log.Fatal("Error with DB %+v", err)
        return true
    }

    return false
}
