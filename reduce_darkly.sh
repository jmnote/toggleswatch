#!/bin/bash
KEYS=(
	'background: no-repeat 50% \/ 50% 50%;'
	'background: no-repeat 50% \/ 100% 100%;'
	'background: no-repeat center center;'
	'border: 0;'
	'border: 0 !important;'
	'border-left: 0.3em solid;'
	'border-left: 0 !important;'
	'border-right: 0;'
	'border-right: 0.3em solid;'
	'border-right: 0 !important;'
	'border-top: 0;'
	'border-top: 0.3em solid;'
	'border-top: 0 !important;'
	'font: 0\/0 a;'
	'font: inherit;'
	'text-shadow: none;'
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
)

cd temp/
ORIG_SIZE=$(stat darkly.css --printf=%s)
echo SIZE=$ORIG_SIZE
for i in "${!KEYS[@]}"; do
	KEY=${KEYS[$i]}
	sed -ni "/^\s*$KEY/g;p" darkly.css
	SIZE=$(stat darkly.css --printf=%s)
	echo -e "[$((i+1))/${#KEYS[@]}] "$KEY" removed...\t$SIZE bytes"
done

echo "Done... ( $ORIG_SIZE bytes → $SIZE bytes )"