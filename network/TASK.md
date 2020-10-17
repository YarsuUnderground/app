https://dcrvosys.herokuapp.com/tasks/create/ - создать задачу
параметры: {int 'creatorId', String 'name', String 'descrition', List <String> 'tags', Datetime 'deadline', List<Int> 'performers', List<Int> 'subtasks', }

https://dcrvosys.herokuapp.com/tasks/create_subtask/ - создать подзадачу
параметры: {int 'taskId', int 'creatorId', String 'name', String 'descrition', Datetime 'deadline', List<Int> 'performers', int 'status' }

https://dcrvosys.herokuapp.com/tasks/delete/ - удалить задачу
параметры: {int 'id'}

https://dcrvosys.herokuapp.com/tasks/delete/ - удалить подзадачу
параметры: {int 'taskId' , int 'id'}

https://dcrvosys.herokuapp.com/tasks/update/ - изменить задачу
параметры: {int 'id' , {key:value}

https://dcrvosys.herokuapp.com/tasks/update_subtask/ - изменить подзадачу (она является частью задачи или сама по себе: удаляется из списка родительской задачи или из всего списка подзадач)
параметры: {int 'id' , {key:value}

https://dcrvosys.herokuapp.com/tasks/all/ - получить массив  всех задач
Возвращает типа такого: [{'_id':new_id, 'creator_id':creator_id, 'name': name, 'description':description, 'tags':tags, 'deadline': deadline, 'performers': performers, 'subtasks':subtasks }]

https://dcrvosys.herokuapp.com/tasks/all_subtasks/ - получить массив  всех подзадач
Возвращает типа такого: [{'_id':new_id, 'creator_id':creator_id, 'name': name, 'description':description,'deadline': deadline, 'performers': performers, 'status':status }]

https://dcrvosys.herokuapp.com/user/user_tasks/ - получить все задачи для пользователя
параметры: {String 'token'}
Возвращает что-то похожее на предыдущее: [{'_id':new_id, 'creator_id':creator_id, 'name': name, 'description':description, 'tags':tags, 'deadline': deadline, 'performers': performers, 'subtasks':subtasks }]
