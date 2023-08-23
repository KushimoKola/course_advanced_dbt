## Task 1
  - We should try as much possible to reduce redundant tests which may lead to `test bloat`.
  - There is high likelihood for dbt tests to be redundant if source, staging, and marts models have the same tests, but no additional joins / heavy transformations happen downstream of stating.

In my examples, I have deleted tests that existed in upstream models but repeated in downstream models

 - dbt `lineage graph/view` is a good resource to help identify relationships between models, how they are used, and determine if tests are repeated across dependent models.

## Task 2
Added a custom generic test `column_is_active.sql` which replaced a redundant singular test. The custom generic test can also be used elsewhere - applying related logic.
