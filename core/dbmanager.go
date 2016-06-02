package core

import (
    "database/sql"
    "fmt"
    log "github.com/Sirupsen/logrus"
	// Import pq client
    _ "github.com/lib/pq"
)

const (
    dbUser     = "rentmycourt"
    dbPassword = "rentmycourt"
    dbName     = "rentmycourt"
)

var db *sql.DB

func initConnection() {
    var err error
    fmt.Println("Init DB connection !")
    dbinfo := fmt.Sprintf("user=%s password=%s dbname=%s sslmode=disable",
        dbUser, dbPassword, dbName)
    db, err = sql.Open("postgres", dbinfo)
    checkErr(err)
}

// Status method test reachibility of DB and connection
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
