#! usr/bin/python3
import sqlite3

connection : sqlite3.Connection = sqlite3.connect("settings.db")
cursor : sqlite3.Cursor = connection.cursor()

def store_setting() -> None:
    ''' Function asks users to input key and values to be stored in settings database. 
        Function adds to dabase if key doesnt exists or updates the existing key.
        Key is unique.
    '''

    ask_key = input('What is the key to the setting? ')
    ask_value = input('What is the value to this key? ')

    cursor.execute('INSERT OR IGNORE INTO settings(key,value) VALUES(?,?)',(ask_key,ask_value,))
    cursor.execute('UPDATE settings SET value = (?) WHERE key = (?)',(ask_value,ask_key))
    connection.commit()

    
    
def view_setting(all_or_not) -> None:
    ''' Function prints all information if choosen 2nd option from menu.
        If 3rd option is choosen, function asks user the key of the settings to print. 
        Prints setting if exists, if no, prints "This setting does not exist."
    '''

    all_settings = cursor.execute('SELECT * FROM settings').fetchall()[:]
    if all_or_not == 'all':
        for settings in all_settings:
            print(f'{settings[1]}: {settings[2]}')
        print('')
    else:
        ask_view = input('What setting do you want to view? ')
        for settings in all_settings:
            if settings[1] == ask_view:
                print(f'{settings[1]}: {settings[2]}')
                main()
        print('This setting does not exist.')
                

def delete_setting() -> None:
    '''Function asks user which setting to delete. Delets setting if exists, if no, prints "This setting does not exist."
    '''
    ask_delete = input('What setting do you want to delete? ')
    all_settings = cursor.execute('SELECT * FROM settings').fetchall()[:]
    for key in all_settings:
        if key[1] == ask_delete:
            cursor.execute('DELETE FROM settings WHERE key = (?)',(ask_delete,))
            print('Setting deleted')
            main()
    print('This setting does not exist.')
    


def main() -> None:
    ''' Main function with main menu. Also creates database settings if not exists.
    '''

    cond = True
    cursor.execute('''CREATE TABLE IF NOT EXISTS settings (
        settingId INTEGER NOT NULL, 
        key TEXT NOT NULL,
        value TEXT NOT NULL,
        PRIMARY KEY (settingId),
        UNIQUE (key)
    )''')
    connection.commit()

    while cond:
        ask_menu = input('''What do you want to do?
1. Store setting      
2. View all settings
3. View setting
4. Delete setting
5. Exit
''')

        if ask_menu == '1':
            store_setting()
        elif ask_menu == '2':
            view_setting('all')
        elif ask_menu == '3':
            view_setting('not all')
        elif ask_menu == '4':
            delete_setting()
        elif ask_menu == '5':
            cond = False
            exit()
        else:
            continue

if __name__ == '__main__':
    main()