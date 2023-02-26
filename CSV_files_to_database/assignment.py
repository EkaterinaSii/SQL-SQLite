import sqlite3
database = "purchases.db"
connection = sqlite3.connect(database)
cursor = connection.cursor()

def dropAndCreateTable(tableName,columns) -> None:
    ''' Function takes table name and columns. 
        If table exists it drops and and creates new one with Id column, then adds other columns. 
    '''

    for column in range(len(columns)):
        if column == 0:
            cursor.execute('DROP TABLE IF EXISTS {name}'.format(name = tableName))
            cursor.execute('CREATE TABLE {name} ({column})'.format(name = tableName, column = columns[column]))
        else:
            cursor.execute('ALTER TABLE {name} ADD {column}'.format(name = tableName, column = columns[column]))

def insertData(values,columns) -> None:
    ''' Functions takes values and list of column names. 
        Creates another list based on the number of columns and inserts the values to table.
    '''
    if len(columns) > 2:
        num = (len(columns)-1) * '?'
        q = f"({','.join(num)})"
        new_columns = [columns[0],f'{tuple(columns[1:])}',q]
    else:
        new_columns = [columns[0],f'({columns[1]})','(?)']
        
    cursor.execute('INSERT INTO "{}" {} VALUES {}'.format(*new_columns),(values))



def main() -> None:
    ''' Function loops through all the files one by one and reads all the content of each file. Name of the table is created based on the file's name.
        Splits the columns with settings, calls function dropAndCreateTable.
        Splits the content of files and calls tion insertData.
        Joins all the data sorted by users' email ASC and prints out.
    '''

    filenames = [ "users.csv", "purchases.csv", "purchaseParts.csv" ]
    listColumns = []


    for filename in filenames:
        with open(filename,'r') as file:
            lines = file.readlines()
            
            tableName = filename[:-4]
            listColumns.append(tableName)
            columns = lines[0].split(',')
            for column in range(len(columns)):
                if column != 0:
                    name = columns[column].split(' ')
                    listColumns.append(name[0])
            
            dropAndCreateTable(tableName,columns)

            for line in range(len(lines)):
                if line != 0:
                    values = lines[line].split(',')
                    del values[0]
                    for i in range(len(values)):
                        try:
                            values[i] = int(values[i])
                        except ValueError:
                            values[i] = values[i].replace('\n','')
                            values[i] = values[i].replace('"','')
                    values = tuple(values)


                    insertData(values,listColumns)
                    connection.commit()
        listColumns = []


    joining = cursor.execute('''SELECT * FROM users
                    JOIN purchases
                    ON users.userId = purchases.userId
                    JOIN purchaseParts
                    ON purchases.purchaseId = purchaseParts.purchaseId
                    ORDER BY users.email ASC''').fetchall()
    for line in joining:
        print(line)

if __name__ == '__main__':
    main()