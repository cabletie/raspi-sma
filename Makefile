RM = rm
CC = gcc
PREFIX?=\"/usr/local\"
_PREFIX=$PREFIX
CFLAGS = -g -Wall -D PREFIX=$(PREFIX)
LIBS = -lbluetooth -lcurl -lm

MAIN = smatool
MAIN_OBJ = smatool.o

TEST = db_test
TEST_OBJ = db_test.o

SQLITE_LIB = -lsqlite3
SQLITE_OBJ = db_sqlite3.o

MYSQL_LIB = -lmysqlclient
MYSQL_OBJ = db_mysql.o

$(MAIN) : $(MYSQL_OBJ) $(MAIN_OBJ)
	$(CC) $(LIBS) $(MYSQL_LIB) $(CFLAGS) -o $(MAIN) $(MAIN_OBJ) $(MYSQL_OBJ)

.c.o :
	$(CC) $(CFLAGS) -c $<  -o $@

.PHONY: clean
clean:
	$(RM) *.o  $(MAIN) $(TEST)

sqlite : $(SQLITE_OBJ) $(MAIN_OBJ)
	$(CC) $(CFLAGS) -o $(MAIN) $(MAIN_OBJ) $(SQLITE_OBJ) $(LIBS) $(SQLITE_LIB)

test : $(MYSQL_OBJ) $(TEST_OBJ)
	$(CC) $(LIBS) $(MYSQL_LIB) $(CFLAGS) -o $(TEST) $(MYSQL_OBJ) $(TEST_OBJ)

sqlite_test : $(SQLITE_OBJ) $(TEST_OBJ)
	$(CC) $(CFLAGS) -o $(TEST) $(SQLITE_OBJ) $(TEST_OBJ) $(LIBS) $(SQLITE_LIB)

.PHONY: install
install: sqlite
	install --mode=555 smatool /usr/local/bin
	install --mode=664 smatool.conf /usr/local/etc
	install --mode=444 sma.in.new /usr/local/lib
	install --mode=444 smatool.cron /etc/cron.d/smatool
