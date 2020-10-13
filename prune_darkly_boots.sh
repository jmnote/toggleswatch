#!/bin/bash

START_WITHS=(
	align-content:
	align-items:
	align-self:
	animation:
	appearance:
	backface-visibility:
	background-clip:
	background-position:
	background-repeat:
	background-size:
	border-radius:
	border-style:
	border-width:
	border-collapse:
	border-top:
	border-top-width:
	border-top-right-radius:
	border-top-left-radius:
	border-right:
	border-bottom:
	border-bottom-width:
	border-bottom-right-radius:
	border-bottom-left-radius:
	border-left:
	border-left-width:
	bottom:
	box-sizing:
	caption-side:
	clear:
	clip:
	column-count:
	column-gap:
	content:
	cursor:
	display:
	flex:
	flex-basis:
	flex-direction:
	flex-flow:
	flex-grow:
	flex-shrink:
	flex-wrap:
	float:
	font:
	font-family:
	font-size:
	font-style:
	font-weight:
	height:
	justify-content:
	left:
	letter-spacing:
	line-break:
	line-height:
	list-style:
	margin:
	margin-bottom:
	margin-left:
	margin-right:
	margin-top:
	max-height:
	max-width:
	min-height:
	min-width:
	opacity:
	order:
	orphans:
	outline:
	outline-offset:
	overflow:
	overflow-anchor:
	overflow-wrap:
	overflow-x:
	overflow-y:
	padding:
	padding-bottom:
	padding-left:
	padding-right:
	padding-top:
	position:
	pointer-events:
	resize:
	right:
	text-decoration:
	text-decoration-skip-ink:
	text-indent:
	text-overflow:
	text-transform:
	text-align:
	top:
	touch-action:
	transform:
	transition:
	transition-property:
	user-select:
	vertical-align:
	visibility:
	width:
	widows:
	white-space:
	word-break:
	word-spacing:
	word-wrap:
	z-index:
	-ms-overflow-style:
	-webkit-appearance: 
	-webkit-text-size-adjust:
	-webkit-overflow-scrolling:
	'@include clearfix('
	'@include border-radius('
	'@include border-top-radius('
	'@include border-top-right-radius('
	'@include border-right-radius('
	'@include border-bottom-radius('
	'@include border-bottom-left-radius('
	'@include border-left-radius('
	'@include box-shadow(none)'
	'@include button-size('
	'@include font-size('
	'@include pagination-size('
	'@include reset-text('
	'@include transition('
	'@import url('
)
REGEXS=(
	'background-image: none;'
	'background: no-repeat center center;'
	'background: no-repeat 50% \/ 50% 50%;'
	'background: no-repeat 50% \/ 100% 100%;'
	'background-color: transparent;'
	'background-color: currentColor;'
	'border: 0;'
	'border: none;'
	'border: solid transparent;'
	'border: .* solid transparent;'
	'border: .* solid currentColor;'
	'border: $custom-range-thumb-border;'
	'border: $pagination-border-width solid $pagination-border-color;'
	'border-color: transparent;'
	'border-color: $pagination-hover-border-color;'
	'border-color: $pagination-active-border-color;'
	'border-color: $pagination-disabled-border-color;'
	'border-right-color: transparent;'
	'bottom: -.25em;'
	'color: inherit;'
	'color: transparent;'
	'color: $pre-color;'
	'font: 0\/0 a;'
	'margin-left: -$input-border-width;'
	'margin-right: -$input-border-width;'
	'max-width: $modal-sm;'
	'max-width: $modal-xl;'
	'opacity: 0;'
	'opacity: $tooltip-opacity;'
	'opacity: $modal-backdrop-opacity;'
	'text-shadow: none;'
	'text-shadow: none !important;',
	'text-shadow: $close-text-shadow;'
	'top: -.5em;'
	'@extend \.btn-sm;'
	'@extend \.btn-lg;'
	'@extend %container-navbar-expand-#{$breakpoint};'
	'@extend %container-nesting-#{$breakpoint};'
	'@extend %container-flex-properties;'
)


du -sh scss/darkly/bootstrap/

# mixins
#sed -i 's/ alert-variant(/ d-alert-variant(/g' bootstrap/*.scss
#sed -i 's/ alert-variant(/ d-alert-variant(/g' bootstrap/*/*.scss

for i in "${!START_WITHS[@]}"; do
	START_WITH=${START_WITHS[$i]}
	sed -ni "/^\s*$START_WITH[^;]*;/g;p" scss/darkly/*/*.scss
	sed -ni "/^\s*$START_WITH[^;]*;/g;p" scss/darkly/*/*/*.scss
done
for i in "${!REGEXS[@]}"; do
	REGEX=${REGEXS[$i]}
	sed -i "s/$REGEX//g" scss/darkly/*/*.scss
	sed -i "s/$REGEX//g" scss/darkly/*/*/*.scss
done


# remove @keyframes
sed -i ':a;N;$!ba;s/@keyframes [^{^}]* {\([^{^}]* {[^{^}]*}\)*[^{^}]*}//g' scss/darkly/*/*.scss
sed -i ':a;N;$!ba;s/@keyframes [^{^}]* {\([^{^}]* {[^{^}]*}\)*[^{^}]*}//g' scss/darkly/*/*/*.scss
#sed -i ':a;N;$!ba;s/@keyframes [^{]* {[^}]* {[^}]*}.*[^}]* {[^}]*}[^}]*}//g' bootstrap/*/*.scss
#sed -i ':a;N;$!ba;s/@keyframes [^{]* {[^}]* {[^}]*}.*[^}]* {[^}]*}[^}]*}//g' bootstrap/*.scss
#sed -i ':a;N;$!ba;s/@keyframes [^{]* {[^}]* {[^}]*}.*[^}]* {[^}]*}[^}]*}//g' bootstrap/*/*.scss

# delete all empty lines,
sed -i '/^[[:space:]]*$/d' scss/darkly/*/*.scss
sed -i '/^[[:space:]]*$/d' scss/darkly/*/*/*.scss

du -sh scss/darkly/bootstrap/

echo "Done..."