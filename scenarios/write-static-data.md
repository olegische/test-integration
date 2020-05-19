# Metadata
- Name: write Static Data   
- Created By: Oleg Romanchuk
- Date Created: 2020-04-08

# Actors
## Primary
## Secondary
- NFC считыватель

# Description
Данные, установленные пользователем в скрипте записываются в NFC метку, если она находится в поле действия NFC считывателя

# Trigger
NFC метка прошла проверку

# Preconditions
1. NFC считыватель подключен к терминалу
2. NFC метка находится в поле действия считывателя
3. NFC метка прошла проверку

# Postconditions
1. Статические данные записаны в память NFC метки

# Normal Flow
3.0 write Static Data
1. write Loader GUID  
  1. Система получает GUID погрузчика из памяти
  2. Система отправляет считывателю команду на запись GUID погрузчика в поле fieldLoaderGUID1
2. write Coordinates
  1. Система отправляет считывателю команду на запись значения широты в поле fieldLocationLatitude
  2. Система отправляет считывателю команду на запись значения долготы в поле fieldLocationLongitude
3. write Start Time
  1. Система отправляет считывателю команду на запись значения текущего времени в поле startLoadDate
4. write Loader Shares
  1. Система отправляет считывателю команду на запись целого числа "1" в поле loaderShares1
5. write State Flags
  1. Система отправляет считывателю команду на запись целого числа "1" в поле stateFlags

# Alternative Flow
Нет

# Exceptions
3.0.E1. NFC считыватель недоступен

# Priority

# Frequency of Use

# Business Rules

# Other Information

# Assumptions
