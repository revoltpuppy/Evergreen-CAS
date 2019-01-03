module.exports = function(grunt) {

	// Project configuration.
	grunt.initConfig({
		pkg: grunt.file.readJSON('package.json'),
		
		/**
		 * CSS post-processors
		 *
		 * autoprefixer-core adds support for older browsers by adding vendor
		 * prefixes to Sass properties, based on data from caniuse.com.
		 */
		postcss: {
	    options: {
		    processors: [
			    /**
					 * Add support for older browsers by adding vendor prefixes to
					 * Sass properties, based on data from caniuse.com.
					 */
		    	require('autoprefixer')(  // add vendor prefixes
						{
							browsers: [
								'last 3 Chrome versions',
								'last 3 Safari versions',
								'last 3 Firefox versions',
								'last 3 iOS versions',
								'last 1 Explorer versions',
								'last 3 ChromeAndroid versions',
								'last 6 Edge versions',  // we can cut this back when we know better how users are updating
							]
						}
					),
				]
			},
			default_styles: {
				src: 'styles.css',
				dest: 'styles.css'
			},
			dev_styles: {
				src: 'styles-dev.css',
				dest: 'styles-dev.css'
			},
		},
		
		/**
		 * Give hints on fixing bugs in JavaScript.
		 */
		jshint: {
			Gruntfile: ['Gruntfile.js'],
		},

		/**
		 * Process Sass into CSS.
		 */
		sass: {
			build: {  // process specific files
				options: {
					style: 'compressed',
					sourcemap: 'none'
				},
				files: [
					{'styles.css': 'styles.scss'},  // 'destination': 'source'
				]
			},
			dev: {  // process specific files
				options: {
					lineNumbers: true,
					style: 'expanded',
					sourcemap: 'none'
				},
				files: [
					{'styles-dev.css': 'styles.scss'},  // 'destination': 'source'
				]
			},
		},

		watch: {
			gruntfile: {  // Validate Gruntfile.
				files: 'Gruntfile.js',
				tasks: ['jshint'],
			},
			css: {  // Autoprefix, then process Sass into CSS.
				files: ['styles.scss', 'sass/**/*.scss'],
				tasks: ['sass', 'postcss']
			},
		},
    
	});

	// Load the plugins.
	grunt.loadNpmTasks('grunt-contrib-jshint');
	grunt.loadNpmTasks('grunt-contrib-sass');
	grunt.loadNpmTasks('grunt-contrib-watch');
	grunt.loadNpmTasks('grunt-postcss');

	// Default task(s).
	grunt.registerTask('default', ['sass', 'postcss', 'jshint']);

};