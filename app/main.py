from aiohttp.web import RouteTableDef, Response, Application, run_app

routes = RouteTableDef()

@routes.get('/')
async def hello_mentor(request):
    return Response(text="Hello, Mentor")


def create_app():
    app = Application()
    app.add_routes(routes)
    return app


if __name__ == '__main__':
    run_app(create_app())