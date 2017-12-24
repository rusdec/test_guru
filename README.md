# TestGuru

## Возможные сущности

### User
  * active
  * first\_name
  * last\_name
  * email
  * password
  * _roles_

### Role
  * name

____

### Subject_area
  * name
  * _tests_

### Test
  * active
  * name
  * date
  * min_score
  * _test\_type_
  * _test\_complexity_
  * _questions_
  * _author_

### Question
  * active
  * name
  * text
  * _question\_complexity_

### QuestionComplexity
  * name
  * level

### TestComplexity
  * name
  * level
  
### TestType
  * name

### TestResult
  * score
  * _test_
  * _user_
  * _result_

___

### Report
  * name
  * _test\_results_
