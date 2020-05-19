# Metadata
- Name: check Card Number
- Created By: Oleg Romanchuk
- Date Created: 2020-04-08

# Actors
## Primary
## Secondary
- NFC считыватель

# Description
Система проверяет серийный номер NFC метки на принадлежность к списку доверенных NFC меток

# Trigger
NFC метка прошла проверку

# Preconditions
1. NFC считыватель подключен к терминалу
2. NFC метка находится в поле действия считывателя

# Postconditions
1. NFC метка прошла проверку

# Normal Flow
2.0 check Card Number
1. Система получает уведомление от считывателя, что карта находится в слоте
2. get Card Number
  1. Система отправляет считывателю команду на чтение серийного номера NFC метки
3. Система считывает список доверенных NFC меток из памяти
4. Система проверяет серийный номер метки на принадлежность к списку доверенных номеров

# Alternative Flow
Нет

# Exceptions
Нет

# Priority

# Frequency of Use

# Business Rules

# Other Information

# Assumptions
