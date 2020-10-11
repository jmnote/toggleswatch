const sass = require('node-sass');
const pkg = require('./package.json');

const banner = `/*!
 * Toggleswatch v${pkg.version}
 * Homepage: ${pkg.homepage}
 * Copyright 2020-${new Date().getFullYear()} ${pkg.author}
 * Licensed under ${pkg.license}
 * Based on Bootstrap
*/
`;

module.exports = function(grunt) {

  grunt.loadNpmTasks('grunt-sass');
  grunt.loadNpmTasks('grunt-concat-css');
  grunt.loadNpmTasks('grunt-contrib-cssmin');

  grunt.initConfig({
    sass: {
      options: {
        implementation: sass,
        outputStyle: 'expanded',
        precision: 6
      },
      flatly: {
        src: ['temp/flatly.scss'],
        dest: 'temp/flatly.css'
      },
      darkly: {
        src: ['build_darkly.scss'],
        dest: 'temp/darkly.css'
      },
			dist: {
        src: ['dist.scss'],
        dest: 'dist/toggleswatch.css'
			},
    },
    concat_css: {
      options: {
      },
      all: {
        src: ["temp/*.css"],
        dest: "dist/toggleswatch.css"
      },
    },
    cssmin: {
      options: {
        level: {
          1: {
            keepSpecialComments: 0,
            roundingPrecision: 6
          }
        }
      },
      dist: {
        src: ['dist/toggleswatch.css'],
        dest: 'dist/toggleswatch.min.css'
      }
    },
  });
  grunt.registerTask('reduce', '', function () {
    const exec = require('child_process').execSync;
    const result = exec('./reduce_darkly2.sh', { encoding: 'utf8' });
    grunt.log.writeln(result);
  });
  grunt.registerTask('default', 'build a theme from scss ', () => {
    grunt.task.run([
      'reduce',
      'sass:flatly',
      'sass:darkly',
			'concat_css',
			'cssmin',
    ]);
  });
};
