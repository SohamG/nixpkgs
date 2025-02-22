{ lib
, buildPythonPackage
, fetchFromGitHub
, flatten-dict
, fsspec
, funcy
, pygtrie
, pytest-mock
, pytestCheckHook
, pythonOlder
, setuptools-scm
, shortuuid
, tqdm
, typing-extensions
}:

buildPythonPackage rec {
  pname = "dvc-objects";
  version = "0.0.23";
  format = "pyproject";

  disabled = pythonOlder "3.8";

  src = fetchFromGitHub {
    owner = "iterative";
    repo = pname;
    rev = "refs/tags/${version}";
    hash = "sha256-kiPDBhqQQJkVR/PWCKd4OFCIRznY3y6pgXiBQ3hBaaM=";
  };

  SETUPTOOLS_SCM_PRETEND_VERSION = version;

  nativeBuildInputs = [
    setuptools-scm
  ];

  propagatedBuildInputs = [
    flatten-dict
    fsspec
    funcy
    pygtrie
    shortuuid
    tqdm
    typing-extensions
  ];

  checkInputs = [
    pytest-mock
    pytestCheckHook
  ];

  pythonImportsCheck = [
    "dvc_objects"
  ];

  meta = with lib; {
    description = "Library for DVC objects";
    homepage = "https://github.com/iterative/dvc-objects";
    license = licenses.asl20;
    maintainers = with maintainers; [ fab ];
  };
}
