/*import Servlets.LoginServlet;
import static org.junit.Assert.*;
import org.junit.*;
import javax.servlet.http.*;
import org.mockito.*;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;


public class LoginServletTest {

    private LoginServlet loginServlet;
    private HttpServletRequest request;
    private HttpServletResponse response;
    private HttpSession session;

    @Before
    public void setUp() {
        loginServlet = new LoginServlet();
        request = Mockito.mock(HttpServletRequest.class);
        response = Mockito.mock(HttpServletResponse.class);
        session = Mockito.mock(HttpSession.class);
        Mockito.when(request.getSession()).thenReturn(session);
    }

    @Test 
    public void testLoginSuccess() {
        Mockito.when(request.getParameter("username")).thenReturn("usuarioValido");
        Mockito.when(request.getParameter("password")).thenReturn("contraseñaCorrecta");
        // Suponiendo que el servlet establece un atributo de sesión en login exitoso
        loginServlet.doPost(request, response);
        Mockito.verify(session).setAttribute("user", "usuarioValido");
    }

    @Test
    public void testLoginFailure() {
        Mockito.when(request.getParameter("username")).thenReturn("usuarioInvalido");
        Mockito.when(request.getParameter("password")).thenReturn("contraseñaErronea");
        // Suponiendo que el servlet maneja el login fallido sin establecer el atributo de sesión
        loginServlet.doPost(request, response);
        Mockito.verify(session, Mockito.never()).setAttribute(Mockito.eq("user"), Mockito.anyString());
    }
}
*/