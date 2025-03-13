from conan import ConanFile
from conan.tools.cmake import cmake_layout


class GameRangerClientRecipe(ConanFile):
	settings = "os", "compiler", "build_type", "arch"
	generators = "MSBuildDeps"

	def requirements(self):
		#self.requires("libjpeg/9e")
		self.requires("wxwidgets/3.2.6")

	def build_requirements(self):
		self.tool_requires("cmake/[>=3.25]")

	def configure(self):
		self.options["wxwidgets/*"].shared = True

	def layout(self):
		#self.folders.generators = ""
		cmake_layout(self)
