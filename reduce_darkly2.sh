#!/bin/bash
KEYS=(
	'background: no-repeat 50% \/ 50% 50%;'
	'background: no-repeat 50% \/ 100% 100%;'
	'background: no-repeat center center;'
	'border: 0;'
	'border: none;'
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
	border-bottom-right-radius:
	border-collapse:
	border-left:
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
	overflow-wrap:
	overflow-x:
	overflow-y:
	padding:
	padding-bottom:
	padding-left:
	padding-right:
	padding-top:
	page-break-after:
	page-break-inside:
	position:
	pointer-events:
	resize:
	right:
	size:
	text-align:
	text-decoration:
	text-decoration-skip-ink:
	text-indent:
	text-overflow:
	text-shadow:
	text-transform:
	top:
	touch-action:
	transform:
	transition:
	transition-property:
	user-select:
	vertical-align:
	visibility:
	white-space:
	width:
	widows:
	word-break:
	word-spacing:
	word-wrap:
	z-index:
	--blue:
	--breakpoint-lg:
	--breakpoint-md:
	--breakpoint-sm:
	--breakpoint-xl:
	--breakpoint-xs:
	--cyan:
	--danger:
	--dark:
	--font-family-monospace:
	--font-family-sans-serif:
	--gray-dark:
	--gray:
	--green:
	--indigo:
	--info:
	--light:
	--orange:
	--pink:
	--primary:
	--purple:
	--red:
	--secondary:
	--success:
	--teal:
	--warning:
	--white:
	--yellow:
	-moz-appearance:
	-moz-user-select:
	-ms-flex:
	-ms-flex-align:
	-ms-flex-direction:
	-ms-flex-flow:
	-ms-flex-item-align:
	-ms-flex-pack:
	-ms-flex-positive:
	-ms-flex-preferred-size:
	-ms-flex-line-pack:
	-ms-flex-negative:
	-ms-flex-order:
	-ms-flex-wrap:
	-ms-overflow-style:
	-ms-touch-action:
	-ms-user-select:
	-webkit-animation:
	-webkit-appearance:
	-webkit-backface-visibility:
	-webkit-box-align:
	-webkit-box-direction:
	-webkit-box-flex:
	-webkit-box-ordinal-group:
	-webkit-box-orient:
	-webkit-box-pack:
	-webkit-box-shadow:
	-webkit-box-sizing:
	-webkit-column-count:
	-webkit-column-gap:
	-webkit-text-decoration:
	-webkit-text-size-adjust:
	-webkit-transform:
	-webkit-transition:
	-webkit-transition-property:
	-webkit-user-select:
	-webkit-overflow-scrolling:
)

rm -rf dist/
rm -rf temp/
mkdir -p temp
cd temp/
cp ../node_modules/bootswatch/dist/flatly/bootstrap.css flatly.scss
cp ../node_modules/bootswatch/dist/darkly/bootstrap.css darkly.scss

ORIG_SIZE=$(stat darkly.scss --printf=%s)
echo SIZE=$ORIG_SIZE
sed ':a;N;$!ba;s/@media print.*}[^}^{]\+}//g' -i darkly.scss

for i in "${!KEYS[@]}"; do
	KEY=${KEYS[$i]}
	sed -ni "/^\s*$KEY/g;p" darkly.scss
	SIZE=$(stat darkly.scss --printf=%s)
	echo -e "[$((i+1))/${#KEYS[@]}] "$KEY" removed...\t$SIZE bytes"
done

echo "Reduced... ( $ORIG_SIZE bytes → $SIZE bytes )"
