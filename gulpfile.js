var gulp = require('gulp');
var concat = require('gulp-concat');
var uglify = require('gulp-uglify');
var minify = require('gulp-minify-css');

gulp.task('js', function(){
    gulp.src('frontend/admin/js/*.js')
        .pipe(concat('admin.js'))
        .pipe(uglify())
        .pipe(gulp.dest('static/admin/js'));
});

gulp.task('css', function(){
    gulp.src('frontend/admin/css/*.css')
        .pipe(concat('admin.css'))
        .pipe(minify())
        .pipe(gulp.dest('static/admin/css'));
});

gulp.task('default',['js','css'],function(){
});