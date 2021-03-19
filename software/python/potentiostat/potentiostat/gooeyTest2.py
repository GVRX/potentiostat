
from gooey import Gooey, GooeyParser

@Gooey(
	program_name="CatImage", suppress_gooey_flag=True, default_size=(800, 600),
	monospace_display=True, richtext_controls=True, image_dir="assets"
)
def main(): # pragma: no cover
	parser = GooeyParser(description="Cat an image to the terminal")
	parser.add_argument("image", type=str, metavar="Image",
		help="Image file or url", widget="FileChooser")
	parser.add_argument("--gui", action="store_true", metavar="GUI",
		help="Start program as a GUI. Note: Has a dumb terminal")
	parser.add_argument("-u", "--url", action="store_true", metavar="URL",
		help="Image is a URL")
	parser.add_argument("-b", "--big", action="store_true", metavar="Big",
		help="Big image")
	parser.add_argument("-c", "--char", action="store", metavar="Char",
		help="Char to use in colour print use $'chr' for escaped chars")
	parser.add_argument("-t", "--disable-truecolour", action="store_true", metavar="Disable Truecolor",
		help="Disable output in truecolour")

	group = parser.add_argument_group("Choose one of the following",
		"Use the following arguments to change the look of the image")
	mxg = group.add_mutually_exclusive_group()
	mxg.add_argument("-g", "--greyscale", action="store_true", metavar="Greyscale",
		help="Output image in greyscale (best for terminals that cannot handle ANSI)")
	mxg.add_argument("-r", "--regular", action="store_true", metavar="Regular",
		help="Output image in regular definition")

	args = parser.parse_args()

	if args.url:
		urllib.request.urlretrieve(args.image, "dowloadedImage.jpg")
		args.image = "dowloadedImage.jpg"

	if platform.system() == "Windows":
		kernel32 = ctypes.windll.kernel32
		kernel32.SetConsoleMode(kernel32.GetStdHandle(-11), 7)

	os.path.exists(args.image)
	catImage(args.image, 130 if args.big else 78, not args.greyscale,
		not args.regular, not args.disable_truecolour, args.char)





if __name__ == '__main__':
    main()