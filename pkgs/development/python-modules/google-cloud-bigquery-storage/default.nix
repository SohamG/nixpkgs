{ lib
, buildPythonPackage
, fetchPypi
, google-api-core
, google-auth
, google-cloud-bigquery
, pytestCheckHook
}:

buildPythonPackage rec {
  pname = "google-cloud-bigquery-storage";
  version = "2.14.0";

  src = fetchPypi {
    inherit pname version;
    sha256 = "sha256-udzLm/aYwXjeyBV70J/NjjhUMLHJ7wXHMS8OSlnrrZU=";
  };

  propagatedBuildInputs = [
    google-api-core
  ];

  checkInputs = [
    google-auth
    google-cloud-bigquery
    pytestCheckHook
  ];

  # dependency loop with google-cloud-bigquery
  doCheck = false;

  preCheck = ''
    rm -r google
  '';

  pythonImportsCheck = [
    "google.cloud.bigquery_storage"
    "google.cloud.bigquery_storage_v1"
    "google.cloud.bigquery_storage_v1beta2"
  ];

  meta = with lib; {
    description = "BigQuery Storage API API client library";
    homepage = "https://github.com/googleapis/python-bigquery-storage";
    license = licenses.asl20;
    maintainers = with maintainers; [ SuperSandro2000 ];
  };
}
