'use strict';
var 	gulp = require('gulp'),
			browserSync = require('browser-sync'),
			stylus = require('gulp-stylus'),
			plumber = require('gulp-plumber'),
			sourcemaps = require('gulp-sourcemaps'),
			autoprefixer = require('gulp-autoprefixer');

gulp.task('browser-sync', function() { // Создаем таск browser-sync
		browserSync({ // Выполняем browser Sync
				server: {
						baseDir: 'app' // Директория для сервера - app
				},
				notify: false // Отключаем уведомления
		});
});

gulp.task('stylus', function () { //Включаем стайлус
	return gulp.src('app/css/styles.styl')
	.pipe(plumber())
	.pipe(stylus({'include css': true}))
	.pipe(gulp.dest('app/css/'));
});

gulp.task('sourcemaps', function () { //Обновляем соурсмап с параметром компрессии
	return gulp.src('app/css/styles.styl')
		.pipe(plumber())
		.pipe(sourcemaps.init())
		.pipe(stylus({
				compress: true
		}))
		.pipe(sourcemaps.write())
		.pipe(autoprefixer(['last 5 versions', '> 1%', 'ie 8', 'ie 7'], { cascade: true }))
		.pipe(gulp.dest('app/css'));
});
 
gulp.task('watch', function () { // Отслеживаем
	gulp.watch('app/css/**/*.css', browserSync.reload);
	gulp.watch('app/**/*.html', browserSync.reload);
	gulp.watch('app/js/**/*.js', browserSync.reload);
	gulp.watch('app/css/**/*.styl', ['sourcemaps']);
});

gulp.task('default', ['browser-sync', 'stylus', 'sourcemaps', 'watch']);