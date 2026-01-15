CREATE INDEX "current_title_index" ON "courses" ("title", "semester") WHERE "semester" LIKE '%2023%' OR "semester" LIKE '%2024%';

CREATE INDEX "student_course_index" ON "enrollments" ("student_id", "course_id");

CREATE INDEX "course_number_index" ON "courses" ("department", "number") WHERE "semester" LIKE '%2023%' OR "semester" LIKE '%2024%';

