Задача №2 
Задача на понимание ssh и создание пользоватей на линукс машинах и доступа к файлам на основе прав:   Создать инстанс в aws. Создать там пользователей Dmitrij и Jon. Дмитрий должен заходить каждый раз только по ssh ключу на инстанс. А Jon должен каждый раз вводить свой пароль при попытке зайти на инстанс.  Dmitrij будет иметь доступ к sudo, а джон не сможет использовать sudo.   Из пользователя Dmitrij создать документ. Используя права доступа сделать так - чтоб  пользователь Jon не смог прочитать содержимое документа.  + Создать нового пользователя чтоб у него по у него был интерпретатор bash по умолчанию (1 день)