-- Создаем таблицу пользователей 
CREATE TABLE users(
    user_id SERIAL PRIMARY KEY,
    first_name VARCHAR(50) NOT NULL
    last_name VARCHAR(50) NOT NULL,
    birth_year INTEGER,
    email VARCHAR(50) UNIQUE NOT NULL,
    role VARCHAR(20) NOT NULL
);
-- Cоздаем таблицу курсов 
CREATE TABLE courses(
    course_id SERIAL PRIMARY KEY,
    title VARCHAR(100) NOT NULL,
    description VARCHAR(50),
    price INTEGER,
    duration INTEGER,
    instructor_id INTEGER REFERENCES users(user_id)
);
-- Создаем таблицу уроков 
CREATE TABLE lessons(
    lesson_id SERIAL PRIMARY KEY,
    title VARCHAR(100) NOT NULL,
    content TEXT,
    order_number INTEGER,
    course_id INTEGER REFERENCES courses(course_id) 
);
-- Создаем таблицу отзывов 
CREATE TABLE reviews(
    review_id SERIAL PRIMARY KEY,
    rating INTEGER
        CHECK (rating >= 1 AND rating <= 5),
    review_text TEXT,
    student_id INTEGER REFERENCES users(user_id),
    course_id INTEGER REFERENCES courses(course_id)
);
-- Создаем таблицу зачислений на курс 
CREATE TABLE enrollments(
    enrollment_id SERIAL PRIMARY KEY,
    student_id INTEGER REFERENCES users(user_id),
    course_id INTEGER REFERENCES courses(course_id),
    progress_percent INTEGER
        CHECK (progress_percent >= 0 AND progress_percent <= 100)
);