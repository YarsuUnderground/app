Получить тип пользователя:
https://dcrvosys.herokuapp.com/user/user_type/
Параметр - 'token'
Возвращаемое значение - {'isAdmin': BooleanValue}

Получить id пользователя:
https://dcrvosys.herokuapp.com/user/user_id/
Параметр - 'token'
Возвращаемое значение - {'id': StringValue}

Получить данные о пользователе:
https://dcrvosys.herokuapp.com/user/user_data/
Параметр - 'token'
Возвращаемое значение - 
{"first_name":"name",
"second_name":"last_name,
"isAdmin": BooleanValue,
"email":'some@er.com',
"phone":'+8324328482842'
}

Получить все задачи для данного пользователя( пока без подзадач и окончательного решения):
https://dcrvosys.herokuapp.com/user/user_tasks/
Параметр - 'token'
Возвращаемое значение - какой-то JSON, надо чекать
