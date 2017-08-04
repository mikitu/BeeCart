var gulp = require('gulp');
var concat = require('gulp-concat');
var uglify = require('gulp-uglify');
var minify = require('gulp-minify-css');

gulp.task('js', function(){
    gulp.src([
            'frontend/admin/js/jquery.min.js',
            'frontend/admin/js/!(jquery.min|dashboard).js',
            'frontend/admin/js/dashboard.js'
        ]
    )
        .pipe(concat('admin.js'))
        // .pipe(uglify())
        .pipe(gulp.dest('static/admin/js'));
});

gulp.task('css', function(){
    gulp.src([
        'frontend/admin/css/app.css',
        'frontend/admin/css/pages/only_dashboard.css',
        'frontend/admin/css/pages/tables.css'
    ])
        .pipe(concat('admin.css'))
        .pipe(minify())
        .pipe(gulp.dest('static/admin/css'));
});

gulp.task('default',['js','css'],function(){
});