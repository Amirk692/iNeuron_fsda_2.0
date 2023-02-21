USE DATABASE DEMODATABASE;

select regexp_count('It was the best of times, it was the worst of times', '\\bwas\\b', 1) as "result" from dual;

select regexp_count('It was the best of times, it was the worst of times', '\\bit\\b', 1,'i') as "result" from dual;

select regexp_count('It was the best of times, it was the worst of times', '\\bit\\b', 1,'c') as "result" from dual;