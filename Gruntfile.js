const sass = require('node-sass');
const pkg = require('./package.json');

const banner = `/*!
 * Toggleswatch v${pkg.version}
 * Homepage: ${pkg.homepage}
 * Copyright 2020-${new Date().getFullYear()} ${pkg.author}
 * Licensed under ${pkg.license}
 * Based on Bootswatch
*/
`;

module.exports = grunt => {
  grunt.loadNpmTasks('grunt-contrib-clean');
  grunt.loadNpmTasks('grunt-contrib-concat');
  grunt.loadNpmTasks('grunt-contrib-cssmin');
  grunt.loadNpmTasks('grunt-sass');

  grunt.initConfig({
    clean: {
      darkly_boots: {
        src: ['scss/darkly/bootstrap/*', 'scss/darkly/bootswatch/*']
      }
    },
    concat: {
      options: {
        banner
      },
      dist: {
        src: ['temp/bootstrap.css'],
        dest: 'dist/bootstrap.css'
      }
    },
    sass: {
      options: {
        implementation: sass,
        outputStyle: 'expanded',
        precision: 6
      },
      flatly: {
        src: ['scss/flatly/flatly.scss'],
        dest: 'temp/flatly.scss'
      },
      darkly: {
        src: ['scss/darkly/darkly.scss'],
        dest: 'temp/darkly.scss'
      },
      dist: {
        src: ['scss/build.scss'],
        dest: 'temp/bootstrap.css'
      }
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
        src: ['dist/bootstrap.css'],
        dest: 'dist/bootstrap.min.css'
      }
    },
  });
  grunt.registerTask('copy:darkly_boots', '', function () {
    let exec = require('child_process').execSync;
    grunt.log.writeln(exec('cp -a node_modules/bootstrap/scss/* scss/darkly/bootstrap/'));
    grunt.log.writeln(exec('cp -a node_modules/bootswatch/dist/darkly/*.scss scss/darkly/bootswatch/'));
  });
  grunt.registerTask('prune:darkly_boots', '', function () {
    let exec = require('child_process').execSync;
    grunt.log.writeln(exec('./prune_darkly_boots.sh'));
  });
  grunt.registerTask('check:temp_darkly', '', function () {
    let exec = require('child_process').execSync;
    grunt.log.writeln(exec('./check_temp_darkly.sh'));
  });
  grunt.registerTask('default', 'build dist css', () => {
    grunt.task.run([
      'clean:darkly_boots',
      'copy:darkly_boots',
      'prune:darkly_boots',
      'sass:flatly',
      'sass:darkly',
      'check:temp_darkly',
      'sass:dist',
      'concat:dist',
      'cssmin:dist',
    ]);
  });
};
