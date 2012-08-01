(function(global) {

    module.exports = function(grunt) {
        grunt.initConfig({
            /**
             * Meta information about plugin.
             */
            meta: {
                project_name: 'Yate',
                project_website: '',
                author: 'Maksim Ryzhikov',
                version: '0.0.1',
                banner: '/*! <%= meta.project_name %> - v<%= meta.version %> - ' + /**/
                '<%= grunt.template.today("yyyy-mm-dd") %>\n' + /**/
                '* http://<%=meta.project_website%>/\n' + /**/
                '* Copyright (c) <%= grunt.template.today("yyyy") %> ' + /**/
                '<%=meta.author%>; Licensed MIT */'
            },
            concat: {
                dist: {
                    src: ['<banner:meta.banner>', '<file_strip_banner:syntax/yate.vim>'],
                    dest: 'syntax/yate.vim'
                }
            }
        });

        grunt.registerTask('default', 'concat');
    };

}(this));
