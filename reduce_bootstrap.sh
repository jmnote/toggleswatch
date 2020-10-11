#!/bin/bash

KEYS=(
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
	border-bottom-left-radius:
	border-left-width:
	border-radius:
	border-style:
	border-top-left-radius:
	border-top-right-radius:
	border-top-width:
	border-width:
	bottom:
	box-sizing:
	caption-side:
	clear:
	clip:
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
	outline:
	outline-offset:
	overflow:
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
	white-space:
	word-break:
	word-spacing:
	word-wrap:
	z-index:
	-webkit-overflow-scrolling:
	'@include font-size('
	'@include border-radius('
	'@include border-bottom-radius('
	'@include border-top-radius('
	'@include transition('
	'@include box-shadow(none)'
)
rm -rf temp/
mkdir -p temp/
cd temp/
cp -a ../node_modules/bootstrap/scss reduced_bootstrap

du -sh reduced_bootstrap/
set -x
for i in "${!KEYS[@]}"; do
	KEY=${KEYS[$i]}
	sed -i "s/ $KEY[^;]*;//g" reduced_bootstrap/*.scss
	sed -i "s/ $KEY[^;]*;//g" reduced_bootstrap/*/*.scss
done

du -sh reduced_bootstrap/
echo "Done..."